//
//  RoundedImage.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI
import Nuke
import NukeUI

struct RoundedImage: View {
    let url: String?
    let size: CGFloat
    
    var body: some View {
        LazyImage(source: url)
            .processors([ImageProcessors.Resize(width: size)])
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: babyCorgiPic, size: 60)
    }
}
