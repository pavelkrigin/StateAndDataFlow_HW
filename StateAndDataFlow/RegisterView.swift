//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 24.10.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            ZStack {
                TextField("Enter your name...", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Text("\(userManager.user.name.count)")
                    .padding(.leading, 340)
                    .foregroundColor(userManager.nameCheck ? .green : .red)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.name = name
            userManager.user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
