import { Aluno } from '../common/aluno';

export class CadastroDeAlunos {
   alunos: Aluno[] = [];

    cadastrar(aluno: Aluno): [Aluno, string] {
     var result = null;
     var msgError = null;

     if (this.cpfNaoCadastrado(aluno.cpf) && this.githubNaoCadastrado(aluno.github)) {
       result = new Aluno();
       result.copyFrom(aluno);
       this.alunos.push(result);
     } else {
       msgError = (this.cpfNaoCadastrado(aluno.cpf)) ? "github duplicado" : "cpf duplicado";
     }
     return [result,msgError];
   }

    cpfNaoCadastrado(cpf: string): boolean {
      return !this.alunos.find(a => a.cpf == cpf);
   }

   githubNaoCadastrado(github: string): boolean {
    return !this.alunos.find(a => a.github == github);
  }

    atualizar(aluno: Aluno): Aluno {
     var result: Aluno = this.alunos.find(a => a.cpf == aluno.cpf);
     if (result) result.copyFrom(aluno);
     return result;
   }

    getAlunos(): Aluno[] {
     return this.alunos;
   }
}