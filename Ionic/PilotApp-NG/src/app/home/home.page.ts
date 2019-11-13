import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router, NavigationExtras} from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  items: any;

  constructor(
    private http: HttpClient,
    private router: Router,
    ) {
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

  itemTapped(item) {
    const navigationExtras: NavigationExtras = {
      state: {
        item: item
      }
    };
    this.router.navigate(['details'], navigationExtras);
  }
}
