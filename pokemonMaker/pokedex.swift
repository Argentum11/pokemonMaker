import SwiftUI

struct pokedex: View {
    @Binding var random:Bool
    @Binding var name:String
    @Binding var attack:Double
    @Binding var birthday:Date
    @Binding var selectedColor:Color
    @Binding var cataIndex:Int
    @Binding var descripton:String
    @Binding var serialNumber:Int
    @Binding var showPokedex:Bool
    let catagories=["一般","水","火","電","草","冰","格鬥","毒","地面","飛行","超能力","蟲","岩石","幽靈","龍","惡","鋼","妖精"]
    var body: some View {
        VStack {
            ZStack {
                Image("book")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                Text(name)
                    .foregroundColor(.white)
                    .offset(x: -70, y: -90)
                Text(catagories[cataIndex]+"屬性")
                    .foregroundColor(.white)
                    .offset(x: -70, y: -70)
                Text("攻擊力:\(Int(attack))")
                    .foregroundColor(.white)
                    .offset(x: -70, y: -50)
                Text("介紹:\(descripton)")
                    .foregroundColor(.white)
                    .offset(x: -70, y: -30)
            }
            Button("重新輸入"){
                showPokedex=false
            }

        }
    }
}
/*
struct pokedex_Previews: PreviewProvider {
    static var previews: some View {
        pokedex(random: true, name: "s", attack: 0, birthday: Date(), selectedColor: Color.red, cataIndex: 0, descripton: "f", serialNumber: 0, showPokedex:.constant(true))
    }
}
*/
