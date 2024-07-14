//
//  DestinationSearchView.swift
//  AirBnB
//
//  Created by Lavkush kumar on 13/07/24.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuest = 0
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    withAnimation (.snappy){
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear"){
                        viewModel.searchLocation = " "
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
           
            }
            .padding()
            
            VStack(alignment:.leading) {
                if selectedOption == .location {
                    Text("Where to")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray))
                    }
                }else{
                    CollapsedPickerView(title: "Where ", description: "Add Destination")
                }
                
            }
            .modifier(CollapsibleDestinationModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            
            //Date Selection View
            
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    Text("When's Your trip?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("Form", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)

                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }else{
                    CollapsedPickerView(title: "When", description: "Add Date")
                    
                }
            }
            .modifier(CollapsibleDestinationModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
            
            
            //Guest Selection View
            VStack(alignment: .leading){
                if selectedOption == .guests{
                    Text("Who is Coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuest) Adults")
                    }onIncrement: {
                        numGuest += 1
                    }onDecrement: {
                        guard numGuest >= 0 else {return}
                        numGuest -= 1
                    }
                    
                }else{
                    CollapsedPickerView(title: "Who", description: "Add Guest")
                    
                }
            }
            .modifier(CollapsibleDestinationModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
        }
        Spacer()
        
    }
}

#Preview {
    DestinationSearchView(show: .constant(false),viewModel: ExploreViewModel(service: ExploreService()))
}


struct CollapsibleDestinationModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
//            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
        }
        //        .padding()
        //        .background(.white)
        //        .clipShape(RoundedRectangle(cornerRadius: 12))
        //        .padding()
        //        .shadow(radius: 10)
    }
}
