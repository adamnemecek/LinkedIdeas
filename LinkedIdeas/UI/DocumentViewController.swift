//
//  DocumentViewController.swift
//  LinkedIdeas
//
//  Created by Felipe Espinoza on 27/08/2016.
//  Copyright © 2016 Felipe Espinoza Dev. All rights reserved.
//

import Cocoa

class DocumentViewController: NSSplitViewController {
  var canvasViewController: CanvasViewController! {
    guard let controller = childViewControllers.lazy.first as? CanvasViewController else {
      preconditionFailure("❌ cannot access to the canvas view controller")
    }

    return controller
  }

  var document: Document! {
    didSet {
      canvasViewController.document = document
      print("-didSetDocument")
    }
  }

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    print("-viewDidLoad")
  }

  override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
    print("-prepareForSegue")
  }

}
