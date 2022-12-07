//
//  ContentView.swift
//  SwiftLearn
//
//  Created by Dio Rovelino on 07/12/22.
//  Copyright © 2022 Dio Rovelino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        Form{
            Section()
                {
                    NavigationLink(destination: AboutView()) {
                        HStack{
                            Image("profile").resizable().frame(width:50 , height:50).clipShape(Circle())
                            VStack(alignment: .leading){
                            Text("Jennifer Maya").font(.headline)
                            Text("Software Engineer").font(.caption)
                        }
                        }
                    }
                    .padding(.top,10)
                    .padding(.bottom,10)
                    
            }
            Section(header: Text("Pengaturan Umum"))
                           {
                            HStack(spacing: 20){
                                Image(systemName:"star.fill").frame(width:35,height:35).background(Color.orange).cornerRadius(10).foregroundColor(Color.white)
                                Text("Pesan Berbintang")
                               }
                            HStack(spacing: 20){
                             Image(systemName:"tv").frame(width:35,height:35).background(Color.green).cornerRadius(10).foregroundColor(Color.white)
                             Text("Whatsapp Web/Desktop")
                            }
                       }
            
            Section(header: Text("Pengaturan Akun"))
                                    {
                                     HStack(spacing: 20){
                                         Image(systemName:"person").frame(width:35,height:35).background(Color.blue).cornerRadius(10).foregroundColor(Color.white)
                                         Text("Akun")
                                        }
                                     HStack(spacing: 20){
                                      Image(systemName:"speaker").frame(width:35,height:35).background(Color.green).cornerRadius(10).foregroundColor(Color.white)
                                      Text("Volume")
                                     }
                                }
            }.navigationBarTitle("Setting")
           
        }
    }
}


struct TabBarViewHome: View {
    var body: some View {
        ZStack{
            TabView{
                HomeView().tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                AboutView().tabItem {
                                   Image(systemName: "paperplane.fill")
                                   Text("Explore")
                               }
                HomeView().tabItem {
                                   Image(systemName: "tray.fill")
                                   Text("Subscription")
                               }
                HomeView().tabItem {
                                   Image(systemName: "envelope.fill")
                                   Text("Kotak Masuk")
                               }
            }
        }.accentColor(Color.red)
    }
    
}


struct HomeView: View {
    var body: some View {
        NavigationView{
            ContentList()
            .navigationBarItems(leading: HStack{
                Image("youtube").resizable().frame(width:60,height:40)
                
                }, trailing: HStack(spacing:20){
                    Button(action:{print("Hello")}) {
                        Image(systemName: "tray.full").foregroundColor(Color.secondary)
                    }
                    Button(action:{print("Hello")}) {
                        Image(systemName: "video.fill").foregroundColor(Color.secondary)
                    }
                    Button(action:{print("Hello")}) {
                        Image(systemName: "magnifyingglass").foregroundColor(Color.secondary)
                    }
                    Button(action:{print("Hello")}) {
                        Image("profile").renderingMode(.original).resizable().frame(width:25, height:25).clipShape(Circle())

                    }
                    
                    
                    
                
            })
        }
    }

}


struct ContentList: View {
    var body: some View {
        List{
            VStack(){
                ZStack(alignment: .bottomTrailing){
                    Image("sleep").resizable().aspectRatio(contentMode: .fill)
                    Text("10:00").padding(.all,5).foregroundColor(Color.white).font(.caption).background(Color.black).cornerRadius(5).padding(.trailing,5).padding(.bottom,5)
                }
                HStack{
                    Image("profile").resizable().frame(width:35,height:35).clipShape(Circle())
                    VStack(alignment:.leading){
                        Text("Rain for 10 Minutes")
                        Text("This music make you fall in sleep").font(.caption)
                       
                        
                    }
                    Spacer()
                                           Image(systemName: "list.bullet")
                }
            }
            VStack(){
                        ZStack(alignment: .bottomTrailing){
                            Image("sleep").resizable().aspectRatio(contentMode: .fill)
                            Text("10:00").padding(.all,5).foregroundColor(Color.white).font(.caption).background(Color.black).cornerRadius(5).padding(.trailing,5).padding(.bottom,5)
                        }
                        HStack{
                            Image("twice").resizable().frame(width:35,height:35).clipShape(Circle())
                            VStack(alignment:.leading){
                                Text("Rain for 10 Minutes")
                                Text("This music make you fall in sleep").font(.caption)
                               
                                
                            }
                            Spacer()
                            Image(systemName: "list.bullet")
                        }
                    }
                
        
        }
    }
}


struct FetchApiPreview: View {
        @State var results = [TaskEntry]()
    func loadData() {
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/todos") else {
            print("Error")
            return
        }
        let request =  URLRequest(url: url)
        
        
        URLSession.shared.dataTask(with: request) {
            data,response, error in if let data = data {
                if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                    DispatchQueue.main.async {
                            self.results = response
                        
                    }
                    return
                }
            }
        }.resume()
    }
    var body: some View {
        List(results, id: \.id) {
            item in VStack(alignment: .leading){
                Text(item.title)
            }
        }.onAppear(perform: loadData)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViewHome()
    }
}



