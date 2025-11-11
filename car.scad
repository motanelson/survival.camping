// CARRO ESPORTIVO - OpenSCAD
// Inspirado no design do car.simulator

// ========== CONFIGURAÇÕES PRINCIPAIS ==========
comprimento_carro = 120;
largura_carro = 60;
altura_carro = 40;
altura_assoalho = 8;
diametro_roda = 25;
largura_roda = 12;

// Posições das rodas
posicao_eixo_dianteiro = 30;
posicao_eixo_traseiro = 90;

// ========== MÓDULOS PRINCIPAIS ==========

// Corpo principal do carro
module corpo_principal() {
    color("Yellow")
    difference() {
        // Forma básica do carro
        hull() {
            // Parte dianteira
            translate([10, 0, altura_assoalho])
            sphere(r=15, $fn=30);
            
            // Cabine
            translate([comprimento_carro/2, 0, altura_assoalho + 25])
            scale([1.2, 1, 0.8])
            sphere(r=20, $fn=30);
            
            // Parte traseira
            translate([comprimento_carro - 10, 0, altura_assoalho + 10])
            sphere(r=18, $fn=30);
        }
        
        // Corte para para-brisas
        translate([comprimento_carro/2 - 10, -largura_carro/2 - 1, altura_assoalho + 35])
        cube([40, largura_carro + 2, 20]);
    }
}

// Chassi/assoalho
module chassi() {
    color("Gray")
    
    difference() {
        // Base plana
        cube([comprimento_carro, largura_carro, altura_assoalho]);
        
        // Alívio de peso
        translate([10, 10, -1])
        cube([comprimento_carro - 20, largura_carro - 20, altura_assoalho + 2]);
    }
    
}

// Rodas
module roda() {
    color("Black")
    difference() {
        // Pneu
        
        rotate([90,0,0])
        cylinder(h=largura_roda*1, r=diametro_roda/2, center=false, $fn=40);
        
        // Aro
        
        //rotate([90,0,0])
        cylinder(h=largura_roda*1, r=5, center=false, $fn=30);
        
        
    }
}

// Para-brisas e janelas
module vidros() {
    color("LightBlue", 0.7)
    union() {
        // Para-brisas dianteiro
        translate([comprimento_carro*0.4, -largura_carro/4 , altura_assoalho + 35])
        rotate([0, 30, 0])
        cube([2, largura_carro/2 , 15]);
        
        // Janelas laterais
        translate([comprimento_carro*0.452, (-largura_carro/4), altura_assoalho + 35])
        cube([30, 2, 12]);
        
        translate([comprimento_carro*0.452, (largura_carro/2)*0.4, altura_assoalho + 35])
        cube([30, 2, 12]);
        
        // Janela traseira
        translate([comprimento_carro*0.7, -largura_carro/4 , altura_assoalho + 35])
        rotate([0, 0, 0])
        cube([2, largura_carro/2 , 12]);
    }
}

// Faróis
module farois() {
    color("Yellow")
    union() {
        // Faróis dianteiros
        translate([5, -largura_carro/4, altura_assoalho + 10])
        sphere(r=4, $fn=20);
        
        translate([5, largura_carro/4, altura_assoalho + 10])
        sphere(r=4, $fn=20);
        
        // Faróis traseiros
        translate([comprimento_carro - 5, -largura_carro/4, altura_assoalho + 10])
        sphere(r=4, $fn=20);
        
        translate([comprimento_carro - 5, largura_carro/4, altura_assoalho + 10])
        sphere(r=4, $fn=20);
    }
}

// Aileron traseiro
module aileron() {
    color("Yellow")
    difference() {
        // Asa principal
        translate([comprimento_carro - 20, -25, altura_assoalho + 25])
        cube([5, 50, 8]);
        
        // Forma aerodinâmica
        translate([comprimento_carro - 25, -26, altura_assoalho + 38])
        rotate([0, 45, 0])
        cube([10, 52, 10]);
    }
}

// Escapamento
module escapamento() {
    color("DarkGray")
    translate([comprimento_carro - 8, -largura_carro/5, altura_assoalho - 2])
    rotate([0, 90, 0])
    cylinder(h=10, r=3, $fn=20);
}

// ========== MONTAGEM FINAL ==========
union() {
    //chassi();
    corpo_principal();
    vidros();
    farois();
    aileron();
    escapamento();
    
    // Rodas
    translate([posicao_eixo_dianteiro, largura_carro/2+(largura_roda*0.1) , diametro_roda/2])
    roda();
    
    translate([posicao_eixo_dianteiro, -largura_carro/2-(-largura_roda*0.9) , diametro_roda/2])
    roda();
    
    translate([posicao_eixo_traseiro, largura_carro/2+(largura_roda*0.1), diametro_roda/2])
    roda();
    
    translate([posicao_eixo_traseiro, -largura_carro/2 -(-largura_roda*0.9), diametro_roda/2])
    roda();
}

// ========== BASE DE EXIBIÇÃO ==========
// Pista/estrada (apenas visual)
//color("DarkGray")
//translate([-50, -100, -1])
//cube([comprimento_carro + 100, 200, 1]);

// ========== INFORMAÇÕES ==========
echo("=== ESPECIFICAÇÕES DO CARRO ===");
echo(str("Dimensões: ", comprimento_carro, "mm x ", largura_carro, "mm x ", altura_carro + diametro_roda/2, "mm"));
echo(str("Tipo: Carro Esportivo"));
echo(str("Rodas: ", diametro_roda, "mm de diâmetro"));
echo("Design inspirado no car.simulator");

/*
INSTRUÇÕES DE PERSONALIZAÇÃO:

PARA CARRO MAIOR:
comprimento_carro = 150;
largura_carro = 70;

PARA CARRO MAIS BAIXO:
altura_carro = 30;
altura_assoalho = 5;

PARA RODAS MAIORES:
diametro_roda = 30;
largura_roda = 15;

PARA MUDAR CORES:
Altere as strings "Yellow", "Black", etc.
*/