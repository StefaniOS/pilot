import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

items: any;

  constructor(public navCtrl: NavController, private http: HttpClient) {

    this.items = [];

		this.http.get('https://picsum.photos/v2/list?page=2&limit=50')
    .subscribe(
    data => {
		  this.items = data;
    },
    err => {
        console.log("Oops!");
    }
		);
	}
		
  itemTapped(event, item) {
    this.navCtrl.push(ItemDetailsPage, {
      item: item
    });
  }
}
