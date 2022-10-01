//
//  ResultTextView.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-10-01.
//

import SwiftUI

struct ResultTextView: View {
  let value: Double
  
  var body: some View {
    Text(value, format: .number)
  }
}

struct ResultTextView_Previews: PreviewProvider {
  static var previews: some View {
    ResultTextView(value: 5.5)
  }
}
