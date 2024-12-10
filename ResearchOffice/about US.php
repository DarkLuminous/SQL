<style>
.header {
  background-color: #fff;
  display: flex;
  flex-direction: column;
  width: 100%;
  align-items: center;
  padding: 26px 80px 15px;
  font: 700 20px Inter, sans-serif;
}

.header-content {
  display: flex;
  width: 520px;
  max-width: 100%;
  flex-direction: column;
}

.logo-container {
  display: flex;
  gap: 32px;
  flex-wrap: wrap;
}

.university-logo {
  aspect-ratio: 0.94;
  object-fit: contain;
  width: 73px;
}

.university-name {
  flex-grow: 1;
  width: 400px;
  margin: auto 0;
}

.nav-menu {
  align-self: center;
  display: flex;
  margin-top: 37px;
  width: 382px;
  max-width: 100%;
  gap: 40px 50px;
}

.nav-item {
  flex-grow: 1;
}

.page-title {
  color: #000;
  align-self: center;
  margin: 82px 0 0 12px;
  font: 700 40px Inter, sans-serif;
}

.nav-link {
    color: #000;
  flex-grow: 1;
  transition: text-decoration 0.3s;
}

.org-chart {
  aspect-ratio: 1.93;
  object-fit: contain;
  width: 100%;
  align-self: center;
  max-width: 1080px;
  margin: 25px 25px 25px 25px;
}

.contact-section {
  width: 100%;
  display: flex;
  gap: 20px;
}

.contact-info {
  display: flex;
  flex-direction: column;
  width: 37%;
  color: #000;
  font: 900 20px Inter, sans-serif;
  align-items: flex-end;
}

.contact-box {
  width: 400px;
  height: 100px;
  background-color: #E4BB4A;
  max-width: 37%;
  padding: 37px 70px;
  left: 20px;
}

.contact-box-small {
  width: 461px;
  background-color: #E4BB4A;
  align-self: flex-start;
  margin-top: 24px;
  max-width: 100%;
  padding: 61px 70px;
}

.contact-heading {
  font-weight: 900;
}

.contact-text {
  font-weight: 500;
}

.connect-section {
  width: 63%;
  margin-left: 20px;
}

.connect-content {
  background-color: #09133B;
  color: #fff;
  text-align: center;
  width: 100%;
  padding: 184px 70px 184px 99px;
  font: 700 60px Inter, sans-serif;
}

.connect-title {
  font-size: 30px;
}

@media (max-width: 991px) {
  .header {
    max-width: 100%;
    padding: 0 20px;
  }
  
  .page-title {
    max-width: 100%;
    margin-top: 40px;
    font-size: 40px;
  }
  
  .org-chart {
    max-width: 100%;
    margin-top: 40px;
  }
  
  .contact-section {
    flex-direction: column;
    align-items: stretch;
    gap: 0;
  }
  
  .contact-info {
    width: 100%;
  }
  
  
  .connect-section {
    width: 100%;
  }
  
  .connect-content {
    font-size: 40px;
    max-width: 100%;
    padding: 100px 20px;
  }
}
</style>

<div class="header">
  <div class="header-content">
    <div class="logo-container">
      <img class="university-logo" src="https://cdn.builder.io/api/v1/image/assets/TEMP/30bfbbfda1949cbeee9e50f46f301a5db19f2bdc0af46734538dd53d320c4602?placeholderIfAbsent=true&apiKey=1fe2be62a44b419e80a79b0e6c9afb51" alt="USTP University Logo" />
      <div class="university-name">
        THE UNIVERSITY OF SCIENCE AND<br />TECHNOLOGY OF SOUTHERN PHILIPPINES
      </div>
    </div>
    <nav class="nav-menu" role="navigation">
      <a href="index.php" class="nav-link">HOME</a>
      <a href="#" class="nav-link">ABOUT US</a>
      <a href="Journals.php" class="nav-link">JOURNALS</a>
    </nav>
  </div>
</div>

<h1 class="page-title">ORGANIZATIONAL STRUCTURE</h1>

<img class="org-chart" src="https://cdn.builder.io/api/v1/image/assets/TEMP/9935871ba7fee27e7e288ba510f741325b6882a6c049448e71f236b541f61ea5?placeholderIfAbsent=true&apiKey=1fe2be62a44b419e80a79b0e6c9afb51" alt="USTP Organizational Structure Chart" />

<div class="contact-section">
  <div class="contact-info">
    <div class="contact-box">
      <span class="contact-heading">Address</span><br />
      <span class="contact-text">
        Office of the Research Claro M. Recto Avenue, Lapasan 9000 Cagayan de Oro City, Philippines
      </span>
    </div>
    <div class="contact-box">
      <span class="contact-heading">Phone</span><br />
      <span class="contact-text">(088) 856 1738</span>
    </div>
    <div class="contact-box">
      <span class="contact-heading">Email</span><br />
      <span class="contact-text">research@ustp.edu.ph</span>
    </div>
  </div>
  <div class="connect-section">
    <div class="connect-content">
      <span class="connect-title">LET'S CONNECT</span><br />
      CONTACT INFORMATION
    </div>
  </div>
</div>