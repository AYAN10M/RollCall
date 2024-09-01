# Geo-Location Based Attendance System

## Overview

This project is a **Geo-Location Based Attendance System** designed for professional office workers. The system tracks employee attendance based on their proximity to predefined office locations. The solution uses **Flutter** for the frontend and **MongoDB** as the backend database. It includes features like real-time presence updates, background location tracking, and secure authentication.

## Features

- **Employee Login and Authentication**: Secure login system for employees.
- **Real-Time Location Tracking**: Continuous tracking of employee location to ensure presence within office premises.
- **Attendance Marking**: Automatically mark attendance when the employee is within the office radius.
- **Background Location Updates**: Background service to track location even when the app is not in use.
- **Geofencing**: Notifications when employees enter or exit the office area.
- **Admin Dashboard**: Real-time monitoring of employee attendance status.

## Tech Stack

- **Frontend**: Flutter
- **Backend**: Node.js/Express (for API services)
- **Database**: MongoDB (with geospatial indexing)
- **Authentication**: JWT (JSON Web Tokens)
- **Hosting**: (e.g., AWS, Heroku, Firebase)

## Installation

### Prerequisites

- Flutter SDK
- Node.js & npm
- MongoDB (local or cloud-based like MongoDB Atlas)
- Android Studio/Xcode (for mobile app development)
