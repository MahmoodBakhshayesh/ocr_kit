package com.example.ocr_kit.Classes;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

public class OcrLineModel {
    @SerializedName("text")
    public String text;
    @SerializedName("cornerPoints")
    public List<OcrCornerPointModel> cornerPoints;

    public OcrLineModel(String text) {
        this.text = text;
        this.cornerPoints = new ArrayList<>();
    }

    // Manual JSON Serialization

}
