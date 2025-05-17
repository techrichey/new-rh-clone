//
//  TopBarView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//

import SwiftUI

struct TopBarView: View {
    let title: String
    let profileURL: URL?
    let onSearch: () -> Void
    let onProfileTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Text(title)
                .font(.title2).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: onSearch) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.white)
            }

            Button(action: onProfileTap) {
                AsyncImage(url: profileURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        // fallback image on error
                        Image(systemName: "person.crop.circle.fill.badge.exclam")
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 35, height: 35)
                .clipShape(Circle())
            }
        }
//        .background(Color.blue) // or your gradient/background
    }
}

 
#Preview {
    
    ZStack {
        
        BackgroundGradient()
        VStack{
            
            TopBarView(title: "Portfolio", profileURL: URL(string: "https://xsgames.co/randomusers/assets/avatars/male/27.jpg"), onSearch: {}, onProfileTap:{})
            Spacer()
        }
    }
   
}

  
