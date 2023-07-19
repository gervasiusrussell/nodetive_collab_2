//
//  Interface.swift
//  NodetiveAddSchedule
//
//  Created by Winsen Tjen on 11/07/23.
//

import SwiftUI

struct AddScheduleView: View {
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.startTime)
    ]) var schedules: FetchedResults<Schedule>
    
    let today = Date()
    let formatter1 = DateFormatter()
    func formatter1.dateStyle = .short
    print(formatter1.string(from: today))
    
    @State private var isSheetPresented = false
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                    .frame(height: 20)
                HStack {
                        Button(action:{
                        }) {
                            NavigationLink(destination: CalendarView()){
                                Image(systemName: "arrowshape.backward")
                                    .padding(.leading)
                                    .imageScale(.large)
                                    .foregroundColor(.black)
                            }
                        }
                    Spacer()
                        .frame(width: 20, height: 0)
                    
                    Text("Add New Schedule")
                        .font(.title2)
                        .padding(.trailing)
                    
                    Spacer()
                        .frame(width: 20, height: 0)
                }
                
                Spacer()
                    .frame(width: 0, height: 50)
                
                Button(action: {
                    isSheetPresented = true
                }) {
                    HStack {
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("Color1"))
                            .padding(.leading, 20)
                        Spacer()
                            .frame(width : 60)
                        
                        Text("Add a new schedule")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(width: 350, height: 90)
                .background(Color.clear)
                .foregroundColor(.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                
//                VStack {
//                    ScrollView {
//                        ForEach(schedules, id:\.self){ schedule in
//                            ScheduleView(bgColor: .black, date: schedule.date, time: schedule.startTime, desc: schedule.descSch)
//                            //                            VStack {
//                            //                                Text(schedule.descSch ?? "unknown")
//                            //                                Text(schedule.date?.description ?? "unknown")
//                            //                            }.background(schedule.category == "Productivity" ? .green : .pink)
//                        }
//                    }
//                }
                    .sheet(isPresented: $isSheetPresented) {
                        OverlayView()
                            .presentationDetents([.height (800)])
                    }
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AddScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        AddScheduleView()
    }
}

