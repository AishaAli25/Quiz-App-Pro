//
//  Score View.swift
//  Quiz
//
//  Created by Aisha Ali on 31/07/2023.
//

import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        VStack {
            CircularProgressView(progress: CGFloat(score) / CGFloat(totalQuestions))
                .frame(width: 150, height: 150)
                .padding()
//            Image("congrats")
//                 .resizable()
//                 .scaledToFit()
//                 .cornerRadius(10)
//                 .frame(width:350)
//                 .padding()
            Text("Congrats! Your total score is ")
                .bold()
                .font(.title2)
            Text("\(score)/\(totalQuestions)")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.pink)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 3, totalQuestions: 5)
    }
}
