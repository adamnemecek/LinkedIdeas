//
//  Element.swift
//  LinkedIdeas
//
//  Created by Felipe Espinoza Castillo on 26/03/16.
//  Copyright © 2016 Felipe Espinoza Dev. All rights reserved.
//

import Foundation

protocol Element {
  var identifier: String { get }
  var area: NSRect { get }

  // center point of element
  var centerPoint: NSPoint { get }

  var attributedStringValue: NSAttributedString { get  set }
  var stringValue: String { get }

  var isEditable: Bool { get set }
  var isSelected: Bool { get set }
}
