//
//  exapmle.swift
//  deneme
//
//  Created by BERKE on 12.01.2022.
//

import SwiftUI

struct exapmle: View {
    @State private var change = false
    var body: some View {
        ZStack{
            TabView{
                Button(action: {
                    self.change = true
                }){
                    Text("Page One")
                }
                    .tabItem({
                        Text("Page 1")
                    })
                Text("Page two")
                    .tabItem({
                        Text("Page 2")
                    })
                Text("Page three")
                    .tabItem({
                        Text("Page 3")
                    })
            }
            .zIndex(0)
            .onAppear{
                UITabBar.appearance().barTintColor = .white
            }
            if change{
                VStack{
                    HStack{
                        Button(action: {
                            self.change = false
                        }){
                            Text("Go back")
                        }
                        Text("faked")
                        
                        Spacer()
                    }
                    Spacer()
                }
                .zIndex(1)
                .background(Color.gray)
                .transition(AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                .animation(.default)
            }
        }
    }
}

struct exapmle_Previews: PreviewProvider {
    static var previews: some View {
        exapmle()
    }
}
