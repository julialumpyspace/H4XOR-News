//
//  ContentView.swift
//  H4XOR News
//
//  Created by Юлія Воробей on 17.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
//        NavigationView {
//            List(networkManager.posts) { post in
//                NavigationLink(destination: NavigationDetailItemView(url: post.url)) {
//                    NavigationItemView(post: post)
//                }
//            }
//            .navigationBarTitle("H4X0R NEWS")
//        }
        NavigationStack {
                   ZStack {
                       VStack {
                           Image("main-BG")
                               .resizable()
                               .scaledToFill()
                               .edgesIgnoringSafeArea(.all)
                               .frame(height: 0)
                           Spacer()
                       }
                       
                       VStack {
                           Spacer()
                           List(networkManager.posts) { post in
                               NavigationLink(destination: NavigationDetailItemView(url: post.url)) {
                                   NavigationItemView(post: post)
                               }
                           }.padding(0)
                       }
                       .navigationTitle("H4X0R NEWS")
                       .font(.title2)
                   }
               }
        
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


#Preview {
    ContentView()
}
