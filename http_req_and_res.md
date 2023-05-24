# Application Programming Interface (API)
If you’re a developer then this word is nothing new for you…

In simple terms, API is a defined set of rules with some defined methods of communication. With the help of API, software components can interact with each other. You might have implemented some kind of APIs (such as payment gateway APIs) in your application.

# Hypertext Transfer Protocol (HTTP)
It is an application-layer protocol for transmitting hypermedia documents, such as HTML. It was designed for communication between web browsers and web servers, but it can also be used for other purposes.

It specifies a collection of request methods to specify what action is to be performed on a particular resource.


## HTTP Request
You make HTTP calls sending the HTTP Request. In HTTP request method includes Request Method, Request URL, Request Headers, Request Body, Pre-request Script, and Tests.

### Request Methods
You will find several types of Request methods.

The most commonly used **HTTP** request methods are **GET**, **POST**, **PUT**, **PATCH**, and **DELETE**. These are equivalent to the **CRUD** operations **(Create, Read, Update, and Delete)**.

**GET**: GET request is used to read/retrieve data from a web server. GET returns an HTTP status code of 200 (OK) if the data is successfully retrieved from the server.

**POST**: POST request is used to send data (file, form data, etc.) to the server. On successful creation, it returns an HTTP status code of 201.

**PUT**: A PUT request is used to modify the data on the server. It replaces the entire content at a particular location with data that is passed in the body payload. If there are no resources that match the request, it will generate one.

**DELETE**: A DELETE request is used to delete the data on the server at a specified location.

### Request URL
A request URL consists of an HTTP method, a base URL, and a resource URL

### Request Headers
In the request header, you enter the key value of the application. The two main key values are given below.

#### Content-Type
The format of data is specified by Content-Type. Mainly developers use JSON format in the content type.
#### Authorization
This information is included to identify the requester.

## HTTP Response
Once you send the request, you get the response back from the API that contains Body, Cookies, Headers, Tests, Status Code, and API Response time. Some important status codes are given below to verify the response.

200– For successful request.

201– For successful request and data was created

204– For Empty Response

400– For Bad Request. 

401– For Unauthorized access. Authentication failed or the user does not have permission for the requested operation. 

403– For Forbidden, Access Denied

404– For data not found.

405– For method not allowed or requested method is not supported.

500– Internal server error.

503– For Service unavailable

[`next`](python_django.md)