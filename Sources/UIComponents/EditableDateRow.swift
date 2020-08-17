//
//  EditableDateRow.swift
//  UIComponents
//
//  Copyright © 2020 Christian Seiler. All rights reserved.
//

import SwiftUI

public struct EditableDateRow: View {

    var title: String
    @Binding var date: Date
    @Binding var isEditing: Bool
    var dateFormatter: DateFormatter

    public init(_ title: String,
         date: Binding<Date>,
         isEditing: Binding<Bool> = .constant(true),
         dateFormatter: DateFormatter = DateFormatter()) {
        self.title = title
        self._date = date
        self._isEditing = isEditing
        self.dateFormatter = dateFormatter
    }

    public var body: some View {
        if isEditing {
            DatePicker(self.title, selection: $date)
        } else {
            HStack {
                Text(self.title)
                Spacer()
                Text(dateFormatter.string(from: date))
            }
        }
    }
}


struct DateRow_Previews: PreviewProvider {

    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        return df
    }()

    static var previews: some View {
        Form {
            Section(header: Text("is Editing")) {
                EditableDateRow("Date",
                                date: .constant(Date()))
            }
            Section(header: Text("not Editing")) {
                EditableDateRow("Date",
                                date: .constant(Date()),
                                isEditing: .constant(false),
                                dateFormatter: dateFormatter)
            }
        }
    }
}

