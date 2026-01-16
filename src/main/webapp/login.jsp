
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin - SatSet Resto</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --fast-red: #e74c3c;
            --fast-yellow: #f1c40f;
            --fast-dark: #2d3436;
        }

        body {
            font-family: 'Poppins', sans-serif;
            /* Background Gambar Restoran Cepat Saji */
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .login-card {
            background: white;
            border-radius: 25px;
            border: 5px solid var(--fast-dark);
            box-shadow: 10px 10px 0px var(--fast-dark);
            width: 100%;
            max-width: 400px;
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .brand-section {
            background: var(--fast-red);
            padding: 25px;
            text-align: center;
            color: white;
            border-bottom: 5px solid var(--fast-dark);
        }

        .brand-section h1 {
            font-family: 'Bungee', cursive;
            font-size: 2rem;
            margin: 0;
            text-shadow: 3px 3px 0px var(--fast-dark);
        }

        .form-padding {
            padding: 30px;
        }

        /* TOMBOL LOGIN UTAMA */
        .btn-fast {
            background: var(--fast-red);
            color: white;
            font-weight: 800;
            text-transform: uppercase;
            border: 3px solid var(--fast-dark);
            border-radius: 12px;
            padding: 12px;
            box-shadow: 4px 4px 0px var(--fast-dark);
            transition: all 0.2s;
        }

        .btn-fast:hover {
            background: var(--fast-yellow);
            color: var(--fast-dark);
            transform: translate(-2px, -2px);
            box-shadow: 6px 6px 0px var(--fast-dark);
        }

        .btn-fast:active {
            transform: translate(2px, 2px);
            box-shadow: 0px 0px 0px var(--fast-dark);
        }

        /* --- TAMBAHAN: TOMBOL KEMBALI (STYLE SEKUNDER) --- */
        .btn-back {
            background: white;
            color: var(--fast-dark);
            font-weight: 700;
            border: 3px solid var(--fast-dark);
            border-radius: 12px;
            padding: 10px;
            text-decoration: none;
            display: block;
            text-align: center;
            transition: all 0.2s;
        }

        .btn-back:hover {
            background: #f0f0f0;
            color: var(--fast-red);
        }
        /* ------------------------------------------------ */

        .form-control {
            border: 2px solid var(--fast-dark);
            border-radius: 10px;
            padding: 12px;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: var(--fast-red);
        }

        .food-icon {
            font-size: 3rem;
            display: block;
            margin-bottom: 5px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="brand-section">
            <i class="bi bi-lightning-charge-fill food-icon text-warning"></i>
            <h1>SatSet Resto</h1>
            <p class="small mb-0">Grab it Fast, Eat it Hot!</p>
        </div>

        <div class="form-padding">
            
            <% if(request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger text-center py-2 mb-3" role="alert" 
                     style="border: 2px solid var(--fast-dark); border-radius: 10px; font-size: 0.9rem;">
                    <i class="bi bi-exclamation-triangle-fill"></i> <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <div id="login-area">
                <form action="LoginServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Masukkan username..." required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-bold">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="******" required>
                    </div>
                    
                    <button type="submit" class="btn btn-fast w-100 mb-3">
                        Mulai Kerja! <i class="bi bi-arrow-right"></i>
                    </button>
                    
                    <div class="text-center">
                        <span class="text-muted small fw-bold">Bukan Admin?</span>
                        <a href="index.jsp" class="btn-back mt-2">
                            <i class="bi bi-house-door-fill"></i> KEMBALI KE BERANDA
                        </a>
                    </div>
                    </form>
            </div>
        </div>
    </div>

</body>
</html>