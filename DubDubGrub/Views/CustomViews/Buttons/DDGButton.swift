//
//  DDGButton.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 4/22/22.
//

import SwiftUI

struct DDGButton: View {
	
	var title: String
	
    var body: some View {
		Text(title)
			.bold()
			.frame(width: 280, height: 44)
			.background(Color.brandPrimary)
			.foregroundColor(.white)
			.cornerRadius(8)
    }
}

struct DDGButton_Previews: PreviewProvider {
    static var previews: some View {
        DDGButton(title: "DDG Button")
    }
}
