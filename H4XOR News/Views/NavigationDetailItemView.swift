//
//  NavigationDetailItemView.swift
//  H4XOR News
//
//  Created by Юлія Воробей on 17.04.2024.
//

import SwiftUI

struct NavigationDetailItemView: View {
    let url: String?
        
        var body: some View {
            WebView(urlString: url)
        }
}

#Preview {
    NavigationDetailItemView(url: "https://www.google.com")
}
