import { Component, OnInit } from '@angular/core';
import { Aluno } from '../../../common/aluno';
import { AlunoService } from './aluno.service';

  @Component({
   selector: 'app-root',
   templateUrl: './alunos.component.html',
   styleUrls: ['./alunos.component.css']
 })
 export class AlunosComponent implements OnInit {

    aluno: Aluno = new Aluno();
    alunos: Aluno[] = [];
    error: boolean = false;
    msgError: string = "";

    constructor(private alunoService: AlunoService) {}

     criarAluno(a: Aluno): void {
       this.alunoService.criar(a)
              .subscribe(
                ar => {
                  if (ar.cpf) {
                    this.alunos.push(ar);
                    this.aluno = new Aluno();
                  } else {
                    this.msgError = String(ar)
                    this.error = true;
                  } 
                },
              );
    } 

    deletar(cpf: string): void {
      this.alunoService.deletar(cpf)
      .subscribe(
        ar => {
          if (ar) {
            var index: number = this.alunos.findIndex(a => a.cpf == cpf);
            this.alunos.splice(index, 1)
          } 
        }
      )
    }

    onMove(): void {
       this.error = false;
    }

     ngOnInit(): void {
       this.alunoService.getAlunos()
             .subscribe(
               as => { this.alunos = as; },
               msg => { alert(msg.message); }
              );
     }

  }