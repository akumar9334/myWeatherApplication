<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>

	        <!-- Digital Clock Container -->
 <div class="cardContainer">
    <div class="clockContainer">
        <img src="images/Animation - compass.gif" alt="Clock Icon" id="clock-icon">
        <!-- Digital Time Display -->
        <div class="digitalTime" id="digitalTime">Loading...</div>
    </div>
</div>

    <div class="mainContainer">


        <!-- Weather Details -->
        <div class="weatherDetails">
            <!-- Search Form -->
            <form action="MyServlet" method="post" class="searchInput">
                <input type="text" placeholder="Enter City Name" id="searchInput" value="${param.city}" name="city" />
                <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>

            <div class="weatherIcon">
                <!-- Weather Icon will be dynamically updated -->
                <img src="${requestScope.weatherIcon}" alt="Weather Icon" id="weather-icon">
                <h2 id="temperature">${requestScope.temperature}°C</h2> <!-- Temperature in Celsius -->
                <input type="hidden" id="wc" value="${requestScope.weatherCondition}" />
            </div>

            <div class="cityDetails">
                <div class="cityName"><strong>${requestScope.city}</strong></div>
                <div class="date" id="date-time">${requestScope.date}</div> <!-- Display date -->
            </div>

            <div class="windDetails">
                <div class="humidityBox">
                    <!-- Humidity Icon -->
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgr7XehXJkOPXbZr8xL42sZEFYlS-1fQcvUMsS2HrrV8pcj3GDFaYmYmeb3vXfMrjGXpViEDVfvLcqI7pJ03pKb_9ldQm-Cj9SlGW2Op8rxArgIhlD6oSLGQQKH9IqH1urPpQ4EAMCs3KOwbzLu57FDKv01PioBJBdR6pqlaxZTJr3HwxOUlFhC9EFyw/s320/thermometer.png" alt="Humidity Icon">
                    <div class="humidity">
                        <span>Humidity</span>
                        <h2>${requestScope.humidity}%</h2>
                    </div>
                </div>

                <div class="windSpeed">
                    <!-- Wind Icon -->
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyaIguDPkbBMnUDQkGp3wLRj_kvd_GIQ4RHQar7a32mUGtwg3wHLIe0ejKqryX8dnJu-gqU6CBnDo47O7BlzCMCwRbB7u0Pj0CbtGwtyhd8Y8cgEMaSuZKrw5-62etXwo7UoY509umLmndsRmEqqO0FKocqTqjzHvJFC2AEEYjUax9tc1JMWxIWAQR4g/s320/wind.png" alt="Wind Icon">
                    <div class="wind">
                        <span>Wind Speed</span>
                        <h2>${requestScope.windSpeed} km/h</h2> <!-- Wind speed in km/h -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Update the digital clock every second
        function updateDateTime() {
            var now = new Date();
            var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' };
            var dateTimeElement = document.getElementById("date-time");
            dateTimeElement.innerHTML = now.toLocaleDateString('en-US', options);

            // Update digital time (HH:MM:SS format)
            var digitalTimeElement = document.getElementById("digitalTime");
            var hours = now.getHours().toString().padStart(2, '0');
            var minutes = now.getMinutes().toString().padStart(2, '0');
            var seconds = now.getSeconds().toString().padStart(2, '0');
            digitalTimeElement.innerHTML = hours + ":" + minutes + ":" + seconds;
        }

        // Call the function initially
        updateDateTime();

        // Update time every second
        setInterval(updateDateTime, 1000);

        // Dynamically update weather icon based on the weather condition
        var weatherIcon = document.getElementById("weather-icon");
        var weatherCondition = document.getElementById("wc").value;

        // Set weather icon based on the condition
        if (weatherCondition) {
            switch (weatherCondition) {
                case 'Clouds':
                    weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwFTkt5z_dxU6w1UnS1PxiZV3HDiPGsAW5Lrsp09MnlCmkQre9GzO8MnGytaaY1eZoqBN6SMJ4U578_uDtiuXswovr1T3o-Kt5KK0mlN_zC0RDodJFaKHQ3Uk-HIZ3vuMvAKNJi8DDFwWA7F6BOxz78Oh-UePwJTuc3PG0ZIZypPE1xlMPl5z46joaEw/s320/Clouds.png";
                    break;
                case 'Clear':
                    weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7pmzNCftryAfpa1YBSzVeYtjgxDQnw09Ug0HVV47J8GEtHPYTH9hJgZ2M1k0YgE0pcZ1qekr4C14zyPCiVuQAfXLClK8Ww3hYB6v77yElP7Lo5BnUKo4n-w6yB17FAbw51WST6YKS0GMwyA4fYNxOZxEyNL6HhUfFRgVhOW0GyRdBRriMHFQ-qfh4cA/s320/sun.png";
                    break;
                case 'Rain':
                    weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgDW_NdwvxV796rkFf43qmUDiTQePn5dg7PDfn1SijfpjtB0AWJMBcifU6LWyW7iOtjZhfqIJnKEGQ1PwbbXS7NoKMSAmvy7i2ljWXMYLue3EBIBBR2qTFbs6QCe5eoFr2CU9WzCVJ8u0J3z3eAo3Ajv1LXamZASFtbj9sA_gD-Kp3hfgAk17Xh17RoLQ/s320/rainy.png";
                    break;
                case 'Mist':
                    weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgVpL23l0t1U_ibWi01TFcHMF6J_t-9Ada5PavGlwG4M_mKIcx0pV1md9SN9ip1d84NaVowml5Do16XO3nsuttnM2-Ov05d-wCjEYjdzaOYfKvijw8k6Hfj9pOiPyEZTp2W20EPbTeONTgJE2Rdxs4KZUfg6f2PmbMF1094NcqJ7DwSFUQwYiRmVCNvuA/s320/mist.png";
                    break;
                case 'Snow':
                    weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-P3iT_uQK95qFY4h7QGdEtbRc1aVQo9BZy0ZWyPBvCNrP-4wnRStw0xYj9e4xa4ZlYISeNZqVJ33UP4YukR4jBennDD_obIN4QxYNZHdzG_z6_MNL2U08wMXwdFhtfvitW5LGiHgrwMJFC8QJFqbSO3woGSBqOdagGxaEQ20_S31Gc-GYL4vYzPzaPw/s320/snow.png";
                    break;
                case 'Haze':
                    weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjld66Ia5g_hpBn3Impi3zzOBHqWkjQInGLxTb2uXksuCsrkQU8HjlVyLobEJEGg8fRSIxeFzldGEHUmWcaiZBwAcRy4dGDpFX1BjTSB56qmBjW5tEW3RSC9_mCuLU_a8RuXchxGY7Oc8HLLl-IfaDW19Z0ZJJfNae9tECXRIyEu7rmJ3da08z8cI-phw/s320/haze.png";
                    break;
            }
        }

    </script>
</body>
</html>
