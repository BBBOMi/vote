/*
minsub
 */
package net.skhu.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class UserToElection {
    int studentidx;
    int electionidx;
    Integer teamidx;
    int abandonment;

    @Builder
    public UserToElection(int studentidx,int electionidx, Integer teamidx, int abandonment){
        this.studentidx = studentidx;
        this.electionidx = electionidx;
        this.teamidx = teamidx;
        this.abandonment =abandonment;
    }
}
