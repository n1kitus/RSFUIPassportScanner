//
//  ContentView.swift
//  Demo-iOS
//
//  Created by Nikita Dobrov on 19/08/2024.
//

import RSFUIPassportScanner
import SwiftUI

struct ContentView: View {
    @State private var result: PassportInfo? = nil
    @State private var presentScanner = false

    var body: some View {
        VStack {
            if let result {
                VStack(content: {
                    LabeledContent("Type", value: result.documentType.rawValue)
                    LabeledContent("Country", value: result.countryCode)
                    LabeledContent("Name", value: result.givenNames)
                    LabeledContent("Surname", value: result.surnames)

                    if let birthdate = result.birthdate {
                        LabeledContent("Birthdate") {
                            Text(birthdate, style: .date)
                        }
                    }
                    if let documentNumber = result.documentNumber {
                        LabeledContent("documentNumber", value: documentNumber)
                    }

                    LabeledContent("Nationality", value: result.nationalityCountryCode)

                    LabeledContent("Sex", value: result.sex.rawValue)

                    if let idNumber = result.identificationNumber {
                        LabeledContent("ID Number", value: idNumber)
                    }
                    if let expiryDate = result.expiryDate {
                        LabeledContent("Expiry Date") {
                            Text(expiryDate, style: .date)
                        }
                    }

                })
            }
            Button(action: {
                result = nil
                presentScanner = true
            }, label: {
                Text("Open Scanner")
            })
        }
        .padding()
        .fullScreenCover(isPresented: $presentScanner, content: {
            PassportScannerView(result: $result)
        })
        .onChange(of: result) {
            if result != nil {
                presentScanner = false
            }
        }
    }
}

#Preview {
    ContentView()
}
