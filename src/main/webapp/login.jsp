<%-- 
    Document   : login
    Created on : 13 Jan 2026, 15:26:30
    Author     : LEGION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SatSet Resto - Fast & Delicious</title>
    
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

        .form-control {
            border: 2px solid var(--fast-dark);
            border-radius: 10px;
            padding: 12px;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: var(--fast-red);
        }

        .toggle-btn {
            color: var(--fast-red);
            text-decoration: underline;
            font-weight: 700;
            cursor: pointer;
        }

        #register-area {
            display: none;
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
            <div id="login-area">
                <form action="doLogin.jsp" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-bold">ID Pelanggan</label>
                        <input type="text" name="user" class="form-control" placeholder="Username kamu..." required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-bold">Password</label>
                        <input type="password" name="pass" class="form-control" placeholder="******" required>
                    </div>
                    <button type="submit" class="btn btn-fast w-100 mb-3">Mulai Pesan! <i class="bi bi-arrow-right"></i></button>
                </form>
                <p class="text-center small">Baru di sini? <span class="toggle-btn" onclick="toggleForm()">Buat Akun</span></p>
            </div>

            <div id="register-area">
                <form action="doRegister.jsp" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Nama Lengkap</label>
                        <input type="text" name="nama" class="form-control" placeholder="Nama kamu..." required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Email</label>
                        <input type="email" name="email" class="form-control" placeholder="email@kamu.com" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-bold">Buat Password</label>
                        <input type="password" name="new_pass" class="form-control" placeholder="******" required>
                    </div>
                    <button type="submit" class="btn btn-fast w-100 mb-3" style="background-color: var(--fast-yellow); color: var(--fast-dark);">Daftar Sekarang!</button>
                </form>
                <p class="text-center small">Sudah punya akun? <span class="toggle-btn" onclick="toggleForm()">Login Saja</span></p>
            </div>
        </div>
    </div>

    <script>
        function toggleForm() {
            const login = document.getElementById('login-area');
            const register = document.getElementById('register-area');
            
            if (login.style.display === "none") {
                login.style.display = "block";
                register.style.display = "none";
            } else {
                login.style.display = "none";
                register.style.display = "block";
            }
        }
    </script>

</body>
</html>