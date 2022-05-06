//
//  ContentView.swift
//  Shared
//
//  Created by Namo Sarawut on 28/4/2565 BE.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedColorIndex = 0
    struct Student: Identifiable {
        let id = UUID()
        let studentId : String;
        let firstname : String;
        let lastname : String;
        let gender : String;
        let totalScore : Int;
        
    }
  
    private var Students = [
        Student(studentId: "10001",firstname: "John",lastname: "Doe",gender: "male",totalScore: 78),
        Student(studentId: "10002",firstname: "Jane",lastname: "Doe",gender: "female",totalScore: 42),
        Student(studentId: "10003",firstname: "Peter",lastname: "Parker",gender: "male",totalScore: 90),
        Student(studentId: "10004",firstname: "Tony",lastname: "Stark",gender: "male",totalScore: 81),
     
    ]
    
    var body: some View {
       
                VStack {
                    Picker("studentGrad", selection: $selectedColorIndex, content: {
                        Text("Student id").tag(0)
                        Text("Score").tag(1)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 300)
                    List{
                        ForEach(selectedColorIndex == 0 ? Students.sorted{(o1,o2) -> Bool in
                            o1.studentId < o2.studentId} : Students.sorted{(o1,o2) -> Bool in
                                o1.totalScore > o2.totalScore}) { student in

                                HStack(spacing:16){
                                    VStack (alignment: HorizontalAlignment.leading){
                                        Text("รหัสนักเรียน: \(student.studentId)")
                                        Text("ชื่อ-สกุล \(student.gender == "female" ? "Ms.":"Mr.")\(student.firstname)")
                                    }
                                    Spacer()
                                    Text("\(String(student.totalScore)) คะแนน")
                                        .foregroundColor(student.totalScore < 50 ? Color.red : Color.black)
                                }

                            
                        }
                    }
                }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
