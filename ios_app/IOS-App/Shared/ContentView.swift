//
//  ContentView.swift
//  Shared
//
//  Created by BERKE on 11.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                NavigationView{
                    NavigationLink(destination: Text("destination")) {
                        Text("Page One")
                    }.navigationTitle("Page 1")
                }
                .tabItem({
                    Text("Page 1")
                })
                NavigationView{
                    Text("Page Two")
                        .navigationTitle("Page 2")
                }
                .tabItem({
                    Text("Page 2")
                })
                NavigationView{
                    Text("Page Three")
                        .navigationTitle("Page 3")
                }
                .tabItem({
                    Text("Page 3")
                })

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
