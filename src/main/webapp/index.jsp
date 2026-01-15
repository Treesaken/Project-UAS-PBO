<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SatSet Resto - Cepat, Lezat, Nikmat!</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@400;700;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --fast-red: #e74c3c;
            --fast-yellow: #f1c40f;
            --fast-dark: #2d3436;
            --fast-white: #ffffff;
        }
        body {
            font-family: 'Poppins', sans-serif;
            overflow-x: hidden;
            background-color: #f9f9f9;
        }

        /* --- Style Agar Fragment Terbaca Bagus --- */
        .navbar-neo { background: var(--fast-white); border-bottom: 4px solid var(--fast-dark); padding: 15px 0; }
        .nav-link { font-weight: 800; color: var(--fast-dark) !important; text-transform: uppercase; }
        .nav-link:hover { color: var(--fast-red) !important; }
        
        .btn-login { background: var(--fast-dark); color: white; border: 2px solid var(--fast-dark); font-weight: bold; box-shadow: 4px 4px 0px var(--fast-red); transition: 0.2s; }
        .btn-login:hover { transform: translate(-2px, -2px); box-shadow: 6px 6px 0px var(--fast-red); color: white; }
        
        .hero-section { background-color: var(--fast-yellow); padding: 100px 0; border-bottom: 4px solid var(--fast-dark); position: relative; }
        .hero-title { font-family: 'Bungee', cursive; font-size: 4rem; color: var(--fast-dark); text-shadow: 4px 4px 0px white; line-height: 1; }
        
        .neo-card { border: 3px solid var(--fast-dark); box-shadow: 8px 8px 0px var(--fast-dark); border-radius: 15px; overflow: hidden; transition: 0.2s; background: white; }
        .neo-card:hover { transform: translateY(-5px); box-shadow: 12px 12px 0px var(--fast-dark); }
        
        .section-title { font-family: 'Bungee', cursive; text-align: center; font-size: 2.5rem; margin-bottom: 50px; text-decoration: underline var(--fast-red) 5px; }
        
        @media (max-width: 768px) { .hero-title { font-size: 2.5rem; } .hero-section { padding: 60px 0; } }
    </style>
</head>
<body>

    <jsp:include page="fragments/navbar.jsp" />

    <jsp:include page="fragments/hero.jsp" />

    <jsp:include page="fragments/about.jsp" />

    <jsp:include page="fragments/gallery.jsp" />

    <jsp:include page="fragments/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>