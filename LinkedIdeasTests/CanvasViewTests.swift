//
//  CanvasProtocolTests.swift
//  LinkedIdeas
//
//  Created by Felipe Espinoza Castillo on 10/03/16.
//  Copyright © 2016 Felipe Espinoza Dev. All rights reserved.
//

import XCTest
@testable import LinkedIdeas

class CanvasViewTests: XCTestCase {
  func testClickOnEmptyCanvas() {
    // given
    let canvas = CanvasView(frame: NSMakeRect(0, 0, 600, 400))
    
    // when
    let clickedPoint = NSMakePoint(20, 60)
    canvas.click(clickedPoint)
    
    // then
    let newConcept: Concept? = canvas.newConcept
    let newConceptView: ConceptView? = canvas.newConceptView
    
    XCTAssertNotNil(newConcept)
    XCTAssertEqual(newConcept!.point, clickedPoint)
    XCTAssertEqual(newConcept!.isEditable, true)
    XCTAssertEqual(newConceptView!.editingString(), true)
    XCTAssertEqual(newConceptView!.textFieldSize, NSMakeSize(60, 20))
  }
  
  func testClickingOnCanvasWhenOtherConceptIsEditable() {
    // given
    let concept1 = Concept(point: NSMakePoint(1, 20))
    let concept2 = Concept(point: NSMakePoint(100, 200))
    let canvas = CanvasView(frame: NSMakeRect(0, 0, 600, 400))
    concept1.isEditable = true
    concept2.isEditable = true
    canvas.concepts.append(concept1)
    canvas.concepts.append(concept2)
    canvas.drawConceptViews()
    
    // when
    canvas.click(NSMakePoint(20, 60))
    
    // then
    XCTAssertEqual(canvas.newConceptView!.editingString(), true)
    XCTAssertEqual(canvas.subviews.count, 3)
    XCTAssertEqual(canvas.concepts.count, 2)
    XCTAssertEqual(concept1.isEditable, false)
    XCTAssertEqual(concept2.isEditable, false)
  }
  
  func testSavingAConcept() {
    // given
    let canvas = CanvasView(frame: NSMakeRect(0, 0, 600, 400))
    let concept = Concept(point: NSMakePoint(100, 200))
    let conceptView = ConceptView(concept: concept, canvas: canvas)
    canvas.newConcept = concept
    canvas.newConceptView = conceptView
    
    // when
    canvas.saveConcept(conceptView)
    
    // then
    XCTAssertNil(canvas.newConcept)
    XCTAssertNil(canvas.newConceptView)
    XCTAssertEqual(canvas.concepts.first!.identifier, concept.identifier)
    XCTAssertEqual(canvas.conceptViews[concept.identifier]!, conceptView)
  }
  
  func testInitializingCanvasViewFromReadingADocument() {
    // given
    let canvas = CanvasView(frame: NSMakeRect(0, 0, 600, 400))
    let concepts = [
      Concept(stringValue: "C1", point: NSMakePoint(20, 30)),
      Concept(stringValue: "C2", point: NSMakePoint(20, 30)),
    ]
    canvas.concepts = concepts
    
    // when
    canvas.drawRect(canvas.bounds)
    
    // then
    XCTAssertEqual(canvas.conceptViews.count, 2)
  }
}