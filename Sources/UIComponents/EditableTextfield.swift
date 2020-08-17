//
//  EditableTextfield.swift
//  PublicTransportCalculator
//
//  Created by Christian Seiler on 18.07.20.
//  Copyright © 2020 Christian Seiler. All rights reserved.
//

import SwiftUI

struct EditableTextfield: View {

    var title: String
    @Binding var text: String
    @Binding var isEditing: Bool

    init(_ title: String,
         text: Binding<String>,
         isEditing: Binding<Bool> = .constant(true)) {
        self.title = title
        _text = text
        _isEditing = isEditing
    }

    var body: some View {
        HStack {
            TextField(title, text: $text)
                .disabled(!isEditing)
            if !text.isEmpty && isEditing {
                Button(action: {
                    self.text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                })
                .foregroundColor(.gray)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            Form {
                Section {
                    EditableTextfield("TEXT1",
                                      text: .constant("Bla"))
                    EditableTextfield("TEXT2",
                                      text: .constant(""))
                }
            }
        }
    }
}
