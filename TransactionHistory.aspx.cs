﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
    public partial class TransactionHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if there is a logged-in user
            if (User.Identity.IsAuthenticated)
            {
                // Check the user type stored in session variable
                string userType = (string)Session["UserType"];

                if (userType != "Customer")
                {
                    // Redirect the user to the login page if not a customer
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    
                }
            }


            // Generate last seen and upcoming movie data
            List<object> lastSeenMovies = GenerateLastSeen();
            List<object> upcomingMovies = GenerateUpcomingMovie();

            // Bind last seen movie data to repeater
            LastSeenRepeater.DataSource = lastSeenMovies;
            LastSeenRepeater.DataBind();

            // Bind upcoming movie data to repeater
            UpcomingMovieRepeater.DataSource = upcomingMovies;
            UpcomingMovieRepeater.DataBind();
        }

        private List<object> GenerateLastSeen()
        {
            List<object> movies = new List<object>();


            var movie1 = new
            {
                MovieName = "Violet Evergarden: The Movie",
                MovieClassification = "R-13",
                MovieGenre = "Animation, Drama, Fantasy",
                MovieDuration = "140 Minutes",
                MovieLanguage = "Japanese",
                MovieHallType = "Big",
                MovieHallNumber = "1",
                MovieDate = "02-Apr-2021",
                MovieTime = "3:15 pm",
                NumberOfSeats = "1",
                BookedSeats = "H12",
                DurationSinceMovieDate = "3 years"
            };

            var movie2 = new
            {
                MovieName = "Demon Slayer: Mugen Train",
                MovieClassification = "R-13",
                MovieGenre = "Animation, Action, Fantasy",
                MovieDuration = "117 Minutes",
                MovieLanguage = "Japanese",
                MovieHallType = "Big",
                MovieHallNumber = "2",
                MovieDate = "03-Apr-2021",
                MovieTime = "6:00 pm",
                NumberOfSeats = "2",
                BookedSeats = "A5, A6",
                DurationSinceMovieDate = "3 years"
            };

            var movie3 = new
            {
                MovieName = "Weathering with You",
                MovieClassification = "PG",
                MovieGenre = "Animation, Romance, Drama",
                MovieDuration = "112 Minutes",
                MovieLanguage = "Japanese",
                MovieHallType = "Small",
                MovieHallNumber = "3",
                MovieDate = "04-Apr-2021",
                MovieTime = "8:30 pm",
                NumberOfSeats = "3",
                BookedSeats = "C10, C11, C12",
                DurationSinceMovieDate = "3 years"
            };

            movies.Add(movie1);
            movies.Add(movie2);
            movies.Add(movie3);

            return movies;
        }

        private List<object> GenerateUpcomingMovie()
        {
            List<object> movies = new List<object>();


            var movie1 = new
            {
                MovieName = "Crazy Rich Asians",
                MovieClassification = "PG-13",
                MovieGenre = "Comedy, Romance",
                MovieDuration = "120 Minutes",
                MovieLanguage = "English",
                MovieHallType = "Big",
                MovieHallNumber = "1",
                MovieDate = "05-Apr-2024",
                MovieTime = "4:00 pm",
                NumberOfSeats = "2",
                BookedSeats = "B8, B9"
            };

            var movie2 = new
            {
                MovieName = "The Proposal",
                MovieClassification = "PG-13",
                MovieGenre = "Comedy, Romance",
                MovieDuration = "108 Minutes",
                MovieLanguage = "English",
                MovieHallType = "Big",
                MovieHallNumber = "2",
                MovieDate = "06-Apr-2024",
                MovieTime = "6:30 pm",
                NumberOfSeats = "2",
                BookedSeats = "D3, D4"
            };

            var movie3 = new
            {
                MovieName = "10 Things I Hate About You",
                MovieClassification = "PG-13",
                MovieGenre = "Comedy, Romance",
                MovieDuration = "97 Minutes",
                MovieLanguage = "English",
                MovieHallType = "Small",
                MovieHallNumber = "3",
                MovieDate = "07-Apr-2024",
                MovieTime = "9:00 pm",
                NumberOfSeats = "3",
                BookedSeats = "F1, F2, F3"
            };

            movies.Add(movie1);
            movies.Add(movie2);
            movies.Add(movie3);

            return movies;
        }
    }


}