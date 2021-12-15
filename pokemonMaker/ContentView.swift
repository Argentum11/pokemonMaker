import SwiftUI

struct ContentView: View {
    @State private var random:Bool=false
    @State private var name:String=""
    @State private var attack:Double=0
    @State private var birthday=Date()
    @State private var selectedColor:Color=Color.blue
    @State private var cataIndex:Int=0
    @State private var descripton:String=""
    @State private var serialNumber:Int=0
    @State private var showPokedex:Bool=false
    @State private var showFavorite:Bool=false
    @State private var showAlert = false
    let catagories=["一般","水","火","電","草","冰","格鬥","毒","地面","飛行","超能力","蟲","岩石","幽靈","龍","惡","鋼","妖精"]
    let randomName=["索爾迦雷歐","水君","銀伴戰獸","卡璞・鳴鳴","卡璞・蝶蝶","卡璞・哞哞","卡璞・鰭鰭","武道熊師","哲爾尼亞斯","蓋歐卡"]
    let grassPokemon=["土台龜","狙射樹梟"]
    let superPokemon=["引夢貘人","魔牆人偶"]
    let dragonPokemon=["雙斧戰龍","烈咬陸鯊"]
    var body: some View {
        NavigationView {
            VStack{
                Image(systemName: random ? "tornado" : "keyboard")
                    .resizable()
                    .frame(width: 200, height: 100)
                Text(random ? "隨機產生" : "手動輸入")
                VStack{
                    Form {
                        
                        Toggle(isOn: $random, label: {
                                Text("隨機產生資料")})
                            .onChange(of: random, perform: { value in
                                if value{
                                    serialNumber=Int.random(in: 0...9999)
                                    attack=Double(Int.random(in: 0...600))
                                    cataIndex=Int.random(in: 0...17)
                                    name=randomName[Int.random(in: 0...9)]
                                    selectedColor=Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                                    
                                }
                            })
                        
                        
                            //onchange
                        HStack {
                            Text("名字")
                            TextField("", text: $name)
                        }
                        HStack {
                            Text("攻擊力")
                            Slider(value: $attack, in: 0...600)
                            Text("\(attack, specifier: "%.0f")")
                        }
                        
                        DatePicker("生日", selection: $birthday,in:...Date(),displayedComponents: .date)
                        ColorPicker("喜歡的顏色", selection: $selectedColor)
                        
                        List{
                            DisclosureGroup("一般屬性神奇寶貝") {
                                ForEach(grassPokemon, id: \.self) { name in
                                    Text(name)
                                }
                            }
                            DisclosureGroup("超能力屬性神奇寶貝") {
                                ForEach(superPokemon, id: \.self) { name in
                                    Text(name)
                                }
                                
                            }
                            DisclosureGroup("龍屬性神奇寶貝") {
                                ForEach(dragonPokemon, id: \.self) { name in
                                    Text(name)
                                }
                                
                            }
                        }
                        Picker(selection: $cataIndex, label: Text("屬性")) {
                            ForEach(catagories.indices){item in
                                Text(catagories[item])
                                
                            }
                        }
                        VStack {
                            Text("介紹")
                            TextEditor(text: $descripton)
                        }
                        Stepper("編號:\(serialNumber)", value: $serialNumber)
                        Button("提交"){
                            showPokedex=true
                        }
                        .sheet(isPresented: $showPokedex, content: {
                            pokedex(random: $random, name: $name, attack: $attack, birthday: $birthday, selectedColor: $selectedColor, cataIndex: $cataIndex, descripton: $descripton, serialNumber: $serialNumber, showPokedex: $showPokedex)
                        })
                    }
                }
                Button("滿意度", action: {
                        showAlert = true
                     })
                    .alert(isPresented: $showAlert) { () -> Alert in
                    return Alert(title: Text("滿意！！！"))
                 }
                Button("我最喜歡的的神奇寶貝", action:{showFavorite.toggle()})
            }
            .fullScreenCover(isPresented: $showFavorite, content:{ favoriteView(display: $showFavorite)}
            )
            .navigationTitle("神奇寶貝製作")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
