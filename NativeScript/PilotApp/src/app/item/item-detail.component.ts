import { Component, OnInit } from "@angular/core";
import { ActivatedRoute } from "@angular/router";

import { Item } from "./item";
import { ItemService } from "./item.service";

import * as dialogs from "tns-core-modules/ui/dialogs";
import * as camera from "nativescript-camera";

@Component({
    selector: "ns-details",
    templateUrl: "./item-detail.component.html",
    styleUrls: ["./item-detail.component.css"]
})
export class ItemDetailComponent implements OnInit {
    item: Item;

    constructor(
        private itemService: ItemService,
        private route: ActivatedRoute
    ) { }

    ngOnInit(): void {
        const id = +this.route.snapshot.params.id;
        this.itemService.getItem(id)
        .subscribe((result) => {
            this.item = result;
        }, (error) => {
            console.log(error);
        });
    }

    showAlert() {
        dialogs.alert({
            title: "Image Source",
            message: this.item.download_url,
            okButtonText: "Ok"
        })
    }

    takePhoto() {

        camera.requestPermissions().then(
            function success() {
                // permission request accepted or already granted 
                camera.takePicture()
                .then((imageAsset) => {
                    // var image = new Image();
                }).catch((err) => {
                    console.log("Error -> " + err.message);
                });
            }, 
            function failure() {
                // permission request rejected
                dialogs.alert({
                    title: "permission request rejected",
                    message: "Please allow this app to access the camera on your device.",
                    okButtonText: "Ok"
                })
            }
        );
    }
}
