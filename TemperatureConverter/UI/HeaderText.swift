//
//  HeaderText.swift
//  UnitConverter
//
//  Created by Zaid Neurothrone on 2022-09-30.
//

import SwiftUI

struct HeaderText: View {
  let text: String
  
  init(_ text: String) {
    self.text = text
  }
  
  var body: some View {
    Text(text)
      .textCase(.none)
  }
}

struct HeaderText_Previews: PreviewProvider {
  static var previews: some View {
    HeaderText("Test")
  }
}
