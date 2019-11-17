import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";

import { Item } from "./item";

@Injectable({
    providedIn: "root"
})
export class ItemService {

        constructor(private http: HttpClient) {}
        
        getItems() {
            return this.http.get<Item[]>("https://picsum.photos/v2/list?page=2&limit=50");
        }

        getItem(id: number) {
            const urlString = `https://picsum.photos/id/${id}/info`;
            console.log(urlString);
            return this.http.get<Item>(urlString);
        }
}
