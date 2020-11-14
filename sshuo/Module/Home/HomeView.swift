import SwiftUI


struct HomeView: View {

    @Environment(\.colorScheme) var cs

    init() {
//        UITabBar.appearance().backgroundColor = UIColor.purple
//        UITabBarItem.appearance().selectedImage = UIImage(named: "book")
//        UITabBar.appearance().barTintColor = UIColor.purple

//        UITabBar.appearance().alpha = 0.94
//        UITabBar.appearance().isHidden = true
//        UITabBar.appearance().unselectedItemTintColor = UIColor.purple
 
    }

    var body: some View {
        TabView(selection: .constant(4)) {
            DiaryView().tabItem {
                Image(systemName: "book")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 22, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("我的")
                    .font(.largeTitle)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
            }.tag(1)
            ShareView().tabItem {
                Image(systemName: "bubble.left.and.bubble.right")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 22, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("发现")
                    .font(.system(size: 40, weight: .light))
                    .foregroundColor(.red)
            }.tag(2)
            AnalyView().tabItem {
                Image(systemName: "wand.and.stars")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 22, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("状态")
            }.tag(3)
            MineView().tabItem {
                Image(systemName: "person")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 12, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("账号")
            }.tag(4)
        }
        .tabViewStyle(DefaultTabViewStyle())
        .accentColor(theme(cs).main)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
