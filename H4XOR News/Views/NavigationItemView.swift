//
//  NavigationItemView.swift
//  H4XOR News
//
//  Created by Юлія Воробей on 17.04.2024.
//

import SwiftUI

struct NavigationItemView: View {
    var post: Post
    
    var date: String {
        return dateFromString(string: post.updated_at)
    }
    
    var body: some View {
        HStack {
            Image(systemName: "newspaper")
                .frame(height: 10, alignment: .bottom)
                .foregroundColor(Color("AppColor"))
                .font(.system(size: 28))
                .padding([.trailing], 3)
                .padding([.leading], -10)
            VStack(alignment: .leading)  {
                Text(post.title)
                    .font(.system(size: 15, design: .monospaced))
                HStack {
                    Text("autor: \(post.author)")
                        .font(.system(size: 12))
                    VStack(alignment: .trailing) {
                        Text(date)
                            .font(.system(size: 12))
                            .foregroundColor(Color("AppColor"))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding([.top], 1)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    func dateFromString(string: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        if let date = dateFormatter.date(from: string) {
            return date.formatted()
        }
        return Date.now.formatted()
    }
}

#Preview {
    NavigationItemView(post: post)
}

let post = Post(
    author: "rbanffy",
    objectID: "3435435",
    title: "Boston Dynamics Retires Its Legendary Humanoid Robot",
    updated_at: "2024-04-17T12:40:58Z",
    url: "https://spectrum.ieee.org/boston-dynamics-atlas-retires"
)
