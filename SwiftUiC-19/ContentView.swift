//
//  ContentView.swift
//  SwiftUiC-19
//  Created by POTCHONA Essosolam Justin on 13/04/2020.
//  Copyright © 2020 POTCHONA Essosolam Justin. All rights reserved.
//

import SwiftUI

struct TopLogoView: View {
    var body: some View {
        HStack {
            Circle()
                    .frame(width: 38)
            Rectangle()
                    .frame(width: 2, height: 50)
            Circle()
                    .frame(width: 38)
            Spacer()
        }
    }
}

struct TopInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            TopLogoView()
            HeaderView()
            TextAndImageInfoView()
            VButtons()
        }
                .padding()
                .background(
                        LinearGradient(gradient:
                        Gradient(colors: [Color(.systemBackground),
                                          Color(.systemGray4)]),
                                startPoint: .top, endPoint: .bottom))
                .listRowInsets(EdgeInsets())
    }
}

struct ContentView: View {
    var body: some View {
        /*creation d'iun composant exten*/

        NavigationView {
            List {
                TopInfoView()
                ForEach(0..<4) { _ in
                    NavigationLink(destination: Text("Coming")) {
                        HStack {
                            ZStack{
                                Circle()
                                        .foregroundColor(.yellow)
                                        .frame(width: 44)
                                Image(systemName: "staroflife.fill")
                                      .foregroundColor(.white)
                            }
                            VStack (alignment: .leading){
                                Text("About COVID-19")
                                .fontWeight(.bold)
                                Text("An up-to-date rundown of the virus and its symptoms")
                            }
                        }
                        .padding()
                    }

                }

            }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
        }

    }
}


struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("COVID-19")
                    .font(.title)
                    .fontWeight(.heavy)
            Text("Screening Tool")
                    .font(.title)
                    .fontWeight(.heavy)

        }
    }
}


struct TextInfoView: View {
    var body: some View {
        VStack {
            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit.")
                    .lineLimit(2)
                    .padding(.trailing)
                    .padding(.bottom)
            Text("Aliquid autem delectus ducimus eaque est eum iste magni maiores maxime minima nam neque nihil quas quos repellat rerum sunt tempora, temporibus.Aliquid autem delectus ducimus eaque est eum iste magni maiores maxime minimanam neque nihil quas quos repellat rerum sunt tempora, temporibus")
        }
                .frame(width: UIScreen.main.bounds.width / 2.2)

    }
}

struct TextAndImageInfoView: View {
    var body: some View {
        HStack {
            TextInfoView()
            Image("person")
                    .padding(.leading)
                    .scaleEffect(3)

        }
    }
}

struct VButtons: View{
    let buttonsLabels = ["Start Screening", "View Previous  Results"]
    var body: some View{
        VStack{
           ForEach(buttonsLabels,id: \.self){ label in
                Button(action:{

                }){
                    Text(label)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32 ,height: 50)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.vertical,8)
                }
           }

        }
        .padding(.top,24)
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}
