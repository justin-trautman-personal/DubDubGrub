//
//  XDismissButton.swift
//  DubDubGrub
//
//  Created by Justin Trautman on 5/5/22.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
		ZStack {
			Circle()
				.frame(width: 30, height: 30)
				.foregroundColor(.brandPrimary)
			Image(systemName: "xmark")
				.foregroundColor(.white)
				.imageScale(.small)
				.frame(width: 50, height: 50)
		}
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
