//
//  ProfileScreen.swift
//  deneme (iOS)
//
//  Created by BERKE on 15.01.2022.
//

import SwiftUI

struct ProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("navColor")
                .edgesIgnoringSafeArea(.all)
            ProfileElements()
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}

struct ProfileElements: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                backButton()
            }
            HStack{
                ZStack {
                    Circle()
                        .frame(width: 150, height: 150, alignment: .top)
                        .foregroundColor(.indigo)
                        .padding(.bottom)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 6, y: 6)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 6, y: -6)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: -6, y: 6)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: -6, y: -6)
                    Text("NAME SURNAME")
                        .foregroundColor(.white)
                        .offset(x: -1, y: -6)
                }
            }
            Spacer()
            VStack(spacing: 1){
                ZStack {
                    HStack{
                        NavigationLink(destination: Text("My address"), label: {
                            Text("My address")
                                .fontWeight(.semibold)
                                .font(.headline)
                                .frame(width: 300, height: 20, alignment: .leading)
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(20)
                            
                        })
                    }
                    Image(systemName: "chevron.right")
                        .offset(x: 140)
                        .foregroundColor(.white)
                }
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .opacity(0.3)
                        .foregroundColor(.white),alignment: .bottom)
                ZStack {
                    HStack{
                        NavigationLink(destination: Text("Profile"), label: {
                            Text("...")
                                .fontWeight(.semibold)
                                .font(.headline)
                                .frame(width: 300, height: 20, alignment: .leading)
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(20)
                            
                        })
                    }
                    Image(systemName: "chevron.right")
                        .offset(x: 140)
                        .foregroundColor(.white)
                    
                }
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .opacity(0.3)
                        .foregroundColor(.white),alignment: .bottom)
                ZStack {
                    HStack{
                        NavigationLink(destination: Text("Profile"), label: {
                            Text("...")
                                .fontWeight(.semibold)
                                .font(.headline)
                                .frame(width: 300, height: 20, alignment: .leading)
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(20)
                            
                        })
                    }
                    Image(systemName: "chevron.right")
                        .offset(x: 140)
                        .foregroundColor(.white)
                    
                }
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .opacity(0.3)
                        .foregroundColor(.white),alignment: .bottom)
                ZStack {
                    HStack{
                        NavigationLink(destination: Text("Profile"), label: {
                            Text("...")
                                .fontWeight(.semibold)
                                .font(.headline)
                                .frame(width: 300, height: 20, alignment: .leading)
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(20)
                            
                        })
                    }
                    Image(systemName: "chevron.right")
                        .offset(x: 140)
                        .foregroundColor(.white)
                    
                }
                .overlay(
                    Rectangle()
                        .frame(height: 0.5)
                        .opacity(0.3)
                        .foregroundColor(.white),alignment: .bottom)
                ZStack {
                    HStack{
                        NavigationLink(destination: Text("Profile"), label: {
                            Text("...")
                                .fontWeight(.semibold)
                                .font(.headline)
                                .frame(width: 300, height: 20, alignment: .leading)
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(.gray)
                                .cornerRadius(20)
                            
                        })
                    }
                    Image(systemName: "chevron.right")
                        .offset(x: 140)
                        .foregroundColor(.white)
                    
                }
            }
            .background(.gray)
            .cornerRadius(20)
            .padding(.top)
            HStack{
                BottomNavBarItem(image: Image(systemName: "house")) {}
                BottomNavBarItem(image: Image(systemName: "heart")) {}
                BottomNavBarItem(image: Image(systemName: "bag")) {}
                BottomNavBarItem(image: Image(systemName: "person")) {}
            }
            .padding()
            .foregroundColor(.white)
            .background(.gray)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.15), radius: 8, x: 2, y: 6)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct backButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Image(systemName: "xmark")
                    .frame(width: 10, height:10)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            })
        }
        .padding(.top)
    }
}
