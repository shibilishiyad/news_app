
import 'package:newsapp/models/slider_model.dart';

List<SliderModel> getslider() {
  List<SliderModel> sliders = [];
  SliderModel sliderModels = SliderModel();

  sliderModels.image = "asset/images/news1.jpg";
  sliderModels.name = "Bow to the Authority Of Silenforce";
  sliders.add(sliderModels);
  sliderModels = SliderModel();

  sliderModels.image = "asset/images/news2.jpg";
  sliderModels.name = "Bow to the Authority Of Silenforce";
  sliders.add(sliderModels);
  sliderModels = SliderModel();

  sliderModels.image = "asset/images/news3.jpg";
  sliderModels.name = "Bow to the Authority Of Silenforce";
  sliders.add(sliderModels);
  sliderModels = SliderModel();

  return sliders;
}
