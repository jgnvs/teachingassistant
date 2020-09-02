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

   deletar(cpf: string): string {
    var result: string = null
    var index: number = this.alunos.findIndex(a => a.cpf == cpf);
    if (index >= 0) {
      this.alunos.splice(index, 1)
      result = cpf
    }
    return result
   }

    getAlunos(): Aluno[] {
     return this.alunos;
   }
}