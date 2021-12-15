import SwiftUI

struct favoriteView: View {
    @Binding var display:Bool
    var body: some View {
        Image("turtle")
        Button("返回", action: {display.toggle()})
    }
}

struct favoriteView_Previews: PreviewProvider {
    static var previews: some View {
        favoriteView(display: .constant(true))
    }
}
