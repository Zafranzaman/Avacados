//
//  BubbleTabBar.swift
//  Avacados
//
//  Created by Zafran on 01/07/2024.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case avocados = 0
    case recipes
    case ripening
    case settings
    
    var title: String {
        switch self {
        case .avocados:
            return "Avocados"
        case .recipes:
            return "Recipes"
        case .ripening:
            return "Ripening"
        case .settings:
            return "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .avocados:
            return "tabicon-branch"
        case .recipes:
            return "tabicon-book"
        case .ripening:
            return "tabicon-avocado"
        case .settings:
            return "tabicon-settings"
        }
    }
}

struct BubbleTabBarView: View {
    
    @State var selectedTab = 0
    @State var isPopoverPresented: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                AvocadosView()
                    .tag(0)
                
                ContentView()
                    .tag(1)
                
                RipeningStagesView()
                    .tag(2)
                
                SettingsView()
                    .tag(3)
            }
            
            
            HStack(spacing: 10) {
                ForEach((TabbedItems.allCases), id: \.self) { item in
                    Button {
                        selectedTab = item.rawValue
                    } label: {
                        CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 16)
            //.padding(.vertical, 10)
            //.background(Color.gray.opacity(0.1).border(Color.gray.opacity(0.1)))
        }
    }
}

extension BubbleTabBarView {
    
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : Color.darkLight)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : Color.darkLight)
                    .fixedSize()
            }
        }
        .padding(.horizontal, isActive ? 12 : 0)
        .padding(.vertical, 8)
        .background(isActive ? Color.eggblue : Color.clear)
        .cornerRadius(25)
    }
}

#Preview {
    BubbleTabBarView()
        
}
