import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class GithubService {
  private apiUrl = 'https://api.github.com/search/repositories';

  constructor(private http: HttpClient) { }

  getTopRepositories() {
    return this.http.get(`${this.apiUrl}?q=stars:>0&sort=stars&order=desc&page=1&per_page=10`);
  }
}
