package com.example.ocr_kit.Classes;

import com.google.gson.annotations.SerializedName;

public class OcrCornerPointModel {
    public OcrCornerPointModel(float x, float y) {

        this.x = x;
        this.y = y;
    }

    @SerializedName("x")

    public float x;

    @SerializedName("y")

    public float y;
}
