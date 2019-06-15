<!--
 - Created by venzor on 3/22/2019.
 -->

<aura:application implements="forceCommunity:availableForAllPageTypes,flexipage:availableForAllPageTypes" extends="force:slds" description="TestingApp">
<lightning:layout>
<lightning:layoutItem size="9">
   <c:MainContainer/>
</lightning:layoutItem>
   <lightning:layoutItem size="3">
      <c:OrderView/>
   </lightning:layoutItem>
</lightning:layout>
</aura:application>