//
//  ContentView.swift
//  Quiz
//
//  Created by Aisha Ali on 31/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    var questions = [Question(title: "What's the capital city of France?",
                              option1: "Brasilia",
                              option2: "Budapest",
                              option3: "Madrid",
                              option4: "Paris",
                              correctOption: 4),
                     Question(title: "What's the capital city of Greece?",
                              option1: "Paris",
                              option2: "Athens",
                              option3: "Berlin",
                              option4: "Rome",
                              correctOption: 2),
                     Question(title: "What's the capital city of Switzerland?",
                              option1: "Bern",
                              option2: "Lisbon",
                              option3: "Vienna",
                              option4: "Vaduz",
                              correctOption: 1),
                     Question(title: "What's the capital city of Croatia?",
                              option1: "Zagreb",
                              option2: "Bratislava",
                              option3: "Warsaw",
                              option4: "Bern",
                              correctOption: 1),
                     Question(title: "What's the capital city of Syria?",
                              option1: "Palmyra",
                              option2: "Aleppo",
                              option3: "Damascus",
                              option4: "Homs",
                              correctOption: 3),
                     Question(title: "What's the capital city of Turkey??",
                              option1: "Istanbul",
                              option2: "Ankara",
                              option3: "Dakar",
                              option4: "Manila",
                              correctOption: 2),
                     Question(title: "A little more difficult ; What's the capital city of the UAE?",
                              option1: "Dubai",
                              option2: "Doha",
                              option3: "Fujairah",
                              option4: "Abu Dhabi",
                              correctOption: 4)
    ]
    
    @State private var currentQuestion = 0
    
    @State private var isAlertPresented = false
    @State private var isCorrect = false
    
    @State private var correctAnswers = 0
    @State private var isModalPresented = false
    
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ProgressView(value: Double(currentQuestion),
                             total: Double(questions.count))
                .padding()
                
                Text(questions[currentQuestion].title)
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(-2)
                
                HStack {
                    VStack {
                        Button {
                            didTapOption(optionNumber: 1)
                        } label: {
                            Image(systemName: "triangle.fill")
                            Text(questions[currentQuestion].option1)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(.red)
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(4)
                        
                        Button {
                            didTapOption(optionNumber: 2)
                        } label: {
                            Image(systemName: "circle.fill")
                            Text(questions[currentQuestion].option2)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(4)
                        
                    }
//                    .padding()
                    
                    VStack {
                        Button {
                            didTapOption(optionNumber: 3)
                        } label: {
                            Image(systemName: "diamond.fill")
                            Text(questions[currentQuestion].option3)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(.yellow)
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(4)
                        
                        Button {
                            didTapOption(optionNumber: 4)
                        } label: {
                            Image(systemName: "square.fill")
                            Text(questions[currentQuestion].option4)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(4)
                    }
//                    .padding()
                    
                }
                .padding()
            }
            .alert(isCorrect ? "Correct" : "Wrong", isPresented: $isAlertPresented) {
                Button("OK") {
                    currentQuestion += 1
                    if currentQuestion == questions.count {
                        isModalPresented = true
                        currentQuestion = 0
                    }
                }
            } message: {
                Text(isCorrect ? "Congrats, you are a CAPITAL MASTER!" : "Uh Oh. That was kinda easy tho :(")
            }
            .sheet(isPresented: $isModalPresented,
                   onDismiss: {
                correctAnswers = 0
            },
                   content: {
                ScoreView(score: correctAnswers,
                          totalQuestions: questions.count)
            })
        }
    }
        
        func didTapOption(optionNumber: Int) {
            if optionNumber == questions[currentQuestion].correctOption {
                print("Correct!")
                isCorrect = true
                correctAnswers += 1
            } else {
                print("Wrong!")
                isCorrect = false
            }
            isAlertPresented = true
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


