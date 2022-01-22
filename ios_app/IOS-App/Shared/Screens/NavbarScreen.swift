//
//  NavbarScreen.swift
//  deneme (iOS)
//
//  Created by BERKE on 13.01.2022.
//

import SwiftUI

struct NavbarScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("navColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    backButton()
                }
                Spacer()
                ListElementView()
                SocialView()
                Spacer()
            }
        }
    }
}

struct NavbarScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavbarScreen()
    }
}

struct NavBackView: View {
    let action: ()-> Void
    var body: some View {
        ZStack {
            VStack {
                Button(action: action, label: {
                    Image(systemName: "xmark")
                        .padding(.all, 12)
                        .background(.white)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                })
            }
        }
    }
}

struct ListElementView: View {
    var body: some View {
        ZStack{
            VStack (alignment: .leading, spacing: 0.6){
                ZStack{
                    HStack{
                        Button(action: {}, label: {
                            Text("Profile")
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
                ZStack{
                    HStack{
                        Button(action: {}, label: {
                            Text("Categories")
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
                ZStack{
                    HStack{
                        Button(action: {}, label: {
                            Text("Shopping Cart")
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
                ZStack{
                    HStack{
                        Button(action: {}, label: {
                            Text("Wallet")
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
                ZStack{
                    HStack{
                        Button(action: {}, label: {
                            Text("Settings")
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
                ZStack{
                    HStack{
                        Button(action: {}, label: {
                            Text("F.A.Q")
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
            .padding(.top)
        }
    }
}

struct SocialView: View {
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    Text("Follow us on social media")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .opacity(0.7)
                }
                .padding(.bottom, 6)
                HStack{
                    Button(action: {}, label: {
                        Image("instagram")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal)
                    })
                    Button(action: {}, label: {
                        Image("facebook")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal)
                    })
                    Button(action: {}, label: {
                        Image("twitter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal)
                    })
                    Button(action: {}, label: {
                        Image("linkedin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.horizontal)
                    })
                }
                .padding(.top, 10)
                .padding(.bottom)
                VStack{
                    Button(action: {}, label: {
                        Text("Terms & Conditions")
                    })
                    Button(action: {}, label: {
                        Text("Privacy Policy")
                            .padding(.top, 5)
                    })
                }
                .font(.callout)
                .foregroundColor(.black)
                .padding(.top)
            }
            .padding()
            .padding(.top)
        }
        .padding()
        .padding(.top)
    }
}
