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
            ShareView().tabItem {
                Image(systemName: "bubble.left.and.bubble.right")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 22, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("发现")
            }.tag(2)
            DiaryView().tabItem {
                Image(systemName: "book")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 22, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("我的")
            }.tag(1)
            AnalyView().tabItem {
                // cloud.bolt.rain 雷暴雨
                // cloud.bolt 雷电
                // cloud.drizzle 下雨
                // cloud 普通
                // cloud.moon 夜晚 cloud.sun 太阳
                // cloud.sun.rain 太阳雨 cloud.moon.rain
                // cloud.snow 下雪
                Image(systemName: "cloud")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 22, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("云村")
            }.tag(3)
            AnalyView().tabItem {
                Image(systemName: "wand.and.stars")
                    .frame(width: 22, height: 32)
                    .font(.system(size: 22, weight: .light))
                    .aspectRatio(contentMode: .fill)
                
                Text("状态")
            }.tag(3)
            AccountView().tabItem {
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
