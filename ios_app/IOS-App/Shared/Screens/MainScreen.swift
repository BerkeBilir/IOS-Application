//
//  MainScreen.swift
//  deneme (iOS)
//
//  Created by BERKE on 17.01.2022.
//

import SwiftUI

struct MainScreen: View {
    @State var SelectIndex = 0
    @State var windowShow = false
    let tabBarImageNames = ["house", "text.justify", "gearshape"]
    var body: some View {
        VStack{
            ZStack{
                
                switch SelectIndex {
                case 0:
                    NavigationView{
                        HomeScreen()
                    }
                case 1:
                    NavbarScreen()
                default:
                    Text("hi")
                }
            }
            Spacer()
            HStack{
                ForEach(0 ..< 3) { num in
                    Button(action: {
                        if num == 2 {
                            windowShow.toggle()
                            return
                        }
                        SelectIndex = num
                    }, label: {
                        Spacer()
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .foregroundColor(SelectIndex == num ? Color(.black):
                                                        .init(white: 0.7))
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.top, 1)
                                .fullScreenCover(isPresented: $windowShow, content: {
                                    ProfileScreen()
                                })
                            
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(SelectIndex == num ? Color(.black):
                                                        .init(white: 0.7))
                                .padding(.top, 1)
                        }
                        
                        Spacer()
                    })
                }
            }
        }
        .background(Color("MainTabColor"))
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
