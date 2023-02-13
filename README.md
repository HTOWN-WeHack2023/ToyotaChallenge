# Toyota Challenge
**Second place winner🏆**

- **What does our app do?**
    
    [**The Toyota Safety and Convenience Package**](https://devpost.com/software/toyota-safety-and-convenience-package) elevates driving experiences with cutting-edge technology. The Houston Hackers joined forces to develop an innovative app that combines **Machine Learning**, **GeoLocation**, and **Turn-by-Turn Navigation**. This synergistic approach aims to curb dangerous cell phone usage while driving and ensure the safety of drivers. By sending notifications to loved ones of any cell phone usage during driving and providing real-time location tracking, the app empowers drivers and their families with peace of mind.
    
- **What type of technology was used within the app?(Libraries, ML model, GeoLocation and Turn by turn tracking)**
    - **Turn-by-Turn navigation and GeoLocation tracking with MapBox API** 
    - **YOLOv3 object detection ML model trained on the COCO dataset leveraged with OpenCV**
- **Why does Toyota benefit from using our features in the app? (protect children and prevent bad habits from developing)**
    - The use of our app's features offers numerous benefits for Toyota. By prioritizing the protection of teenagers and preventing bad habits from developing, Toyota not only demonstrates its commitment to safety but also establishes itself as a leader in innovation and caution within the automotive industry. This focus on customer well-being sets Toyota apart from its competitors and builds trust and loyalty among its customers, as it is clear that the company is not solely focused on profits, but places a high value on ensuring the safety and security of its users. In turn, this enhances Toyota's reputation as the most responsible and innovative car manufacturer, further solidifying its position as a trusted brand in the minds of consumers.
- **What Tech Stack was used**
    - Dart and the Flutter framework for the UI and Python with FastAPI for the backend

# **Setup**

### F**rontend:**

Make sure flutter is [**installed**](https://docs.flutter.dev/get-started/install) on your PC 

If flutter is installed navigate into the ToyotaChallenge/frontend/ directory and run 

```jsx
“pub get” 
```

and 

```jsx
“flutter run”
```

### **Backend:**

Before going into the installation make sure to setup a virtual environment with Python in the ToyotaChallenge/backend/ directory. To create the enviroment folder and intiat it use the following commands “python -m venv ToyotaChallenge/backend/venv” and to activate the enviroment traverse into the ToyotaChallenge/backend/venv/Scripts  directory that was just created and run the following command ./activate.

**Dependencies:**

<ul>
    <li> 
        <a href="https://pjreddie.com/darknet/yolo/" >YOLO</a>
    </li>
    <li>
        <a href="https://opencv.org/" >OpenCV</a>
    </li>
</ul>

For YOLO you must download yolo.weights and place the file in the ToyotaChallenge/backend/yolo-coco-data/ directory

- The weights can be downloaded by:
    
    ```jsx
    $ wget [https://pjreddie.com/media/files/yolov3.weights](https://pjreddie.com/media/files/yolov3.weights)
    or
    [https://github.com/pjreddie/darknet/blob/master/data/coco.names](https://github.com/pjreddie/darknet/blob/master/data/coco.names)
    ```
    

Make sure ./yolo-coco/data/ contains coco.names, yolo.weights, and yolov3.cfg

### YOLOv3 Example
![Capture3](https://user-images.githubusercontent.com/46977634/80386874-e0263780-889f-11ea-9db5-42aada0293cf.JPG)

### Keywords
- **Mapbox**: a mapping and location cloud platform for developers and designers to build real-time location awareness into their apps.
- **YOLOv3**: real-time object detection algorithm that identifies specific objects in videos, live feeds, or images.
- **COCO**: is a large-scale object detection, segmentation, and captioning dataset. COCO has several features: Object segmentation, Recognition in context, Superpixel stuff segmentation, 330K images (>200K labeled), 1.5 million object instances, 80 object categories, 91 stuff categories, 5 captions per image, 250,000 people with keypoints
